require 'erb'
require 'dsc_utils'
test_name 'MODULES-2264 - C68727 - Apply DSC Service Resource with Valid "Name", "StartupType" and "State" Specified'

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'service'
dsc_props = {
  :dsc_name        => 'w32time',
  :dsc_state       => 'Running',
  :dsc_startuptype => 'Automatic'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  confine_block(:to, :platform => 'windows') do
    step 'Remove Test Artifacts'
    set_dsc_resource(
      agents,
      dsc_type,
      :Name        => 'w32time',
      :State       => 'Stopped',
      :StartupType => 'Manual'
    )
  end
end

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Apply Manifest'
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify Results'
    assert_dsc_resource(
      agent,
      dsc_type,
      :Name        => dsc_props[:dsc_name],
      :State       => dsc_props[:dsc_state],
      :StartupType => dsc_props[:dsc_startuptype]
    )
  end
end