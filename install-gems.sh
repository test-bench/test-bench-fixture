#!/usr/bin/env bash

set -eEuo pipefail

function boolean-var {
  variable_name=$1
  default=${2:-no}

  val=${!variable_name:=$default}

  if [[ "n|no|f|false|off|0" =~ $val ]]; then
    echo 'false'
  elif [[ "y|yes|t|true|on|1" =~ $val ]]; then
    echo 'true'
  else
    echo "Variable \$$variable_name is set to \`$val' which is not a boolean value" >&2
    echo >&2
    exit 1
  fi
}

echo
echo "Installing gems locally"
echo "= = ="

if [ -z ${REMOVE_GEMS+x} ]; then
  echo
  echo "(REMOVE_GEMS is not set. Using \"on\" by default.)"
  remove_gems="on"
else
  remove_gems=$REMOVE_GEMS
fi

if [ -z ${POSTURE+x} ]; then
  echo "(POSTURE is not set. Using \"operational\" by default.)"
  posture="operational"
else
  posture=$POSTURE
fi

gemspec=$(ls *.gemspec | head -n 1 || true)
if [ -z "$gemspec" ]; then
  echo "No gemspec found"
  exit 1
fi

gem_dir="./gems"
install_dir="$gem_dir/ruby/$(ruby -rrbconfig -e "puts RbConfig::CONFIG['ruby_version']")"
export GEM_HOME="$install_dir"

echo "Posture: $posture"
echo "Gemspec: $gemspec"

remove_gems=$(boolean-var remove_gems)
if $remove_gems; then
  echo
  echo "Removing installed gems"
  echo "- - -"

  cmd="rm -rf $gem_dir"

  echo $cmd
  ($cmd)
fi

echo
echo "Installing gems"
echo "- - -"

cmd="gem build $gemspec --output install-gems.gem --quiet"
echo $cmd
gem_name=$($cmd | sed -E -n 's/^[[:blank:]]*Name:[[:blank:]]*(.*)$/\1/p')

cmd="gem install --no-user-install install-gems.gem"
if [ operational != "$posture" ]; then
  cmd="$cmd --development"
fi
echo $cmd
($cmd)
echo

cmd="gem uninstall --executables --no-user-install $gem_name"
echo $cmd
($cmd)
echo

cmd="gem cleanup --no-user-install"
echo $cmd
($cmd)
echo

rm -vf install-gems.gem
echo

mkdir -p $gem_dir/exec

ruby -rrubygems -rpathname <<RUBY
relative_gem_dir = '$gem_dir'

gem_dir = Pathname(relative_gem_dir)

File.open(gem_dir.join('gems_init.rb'), 'w') do |gems_init_rb|
  gems_init_rb.puts "# Generated by $0\n\n"

  Dir['$install_dir/specifications/*.gemspec'].each do |gemspec|
    spec = Gem::Specification.load(gemspec)

    spec.full_require_paths.each do |full_require_path|
      require_path = Pathname(full_require_path).relative_path_from(gem_dir.expand_path)

      gems_init_rb.puts "\$LOAD_PATH.push(File.expand_path('#{require_path}', __dir__))"
    end

    spec.executables.each do |executable|
      internal_executable_path = Pathname(spec.bin_file(executable)).relative_path_from(gem_dir.expand_path('exec'))

      File.open(gem_dir.join('exec', executable), 'w') do |executable|
        executable.write(<<-RUBY)
#!/usr/bin/env ruby
#
# Generated by install-gems.sh

require_relative '../gems_init'

load File.expand_path('#{internal_executable_path}', __dir__)
        RUBY

        File.chmod(0755, executable.path)

        puts "Wrote executable: #{executable.path} (#{spec.name})"
      end
    end
  end

  puts "Wrote #{gems_init_rb.path}"
end
RUBY

echo
echo "(done)"
echo "- - -"
echo
