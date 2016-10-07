#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xregistry) do

  let :dsc_xregistry do
    Puppet::Type.type(:dsc_xregistry).new(
      :name     => 'foo',
      :dsc_key => 'foo',
      :dsc_valuename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xregistry).new(
      :name     => 'foo',
      :dsc_key => 'foo',
      :dsc_valuename => 'foo',
      :dsc_valuedata => ["foo", "bar", "spec"],
      :dsc_valuetype => 'String',
      :dsc_ensure => 'Present',
      :dsc_hex => true,
      :dsc_force => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xregistry.to_s).to eq("Dsc_xregistry[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xregistry[:ensure]).to eq :present
  end

  it 'should require that dsc_key is specified' do
    #dsc_xregistry[:dsc_key]
    expect { Puppet::Type.type(:dsc_xregistry).new(
      :name     => 'foo',
      :dsc_valuename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_key is a required attribute/)
  end

  it 'should not accept array for dsc_key' do
    expect{dsc_xregistry[:dsc_key] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_key' do
    expect{dsc_xregistry[:dsc_key] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_key' do
    expect{dsc_xregistry[:dsc_key] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_valuename is specified' do
    #dsc_xregistry[:dsc_valuename]
    expect { Puppet::Type.type(:dsc_xregistry).new(
      :name     => 'foo',
      :dsc_key => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_valuename is a required attribute/)
  end

  it 'should not accept array for dsc_valuename' do
    expect{dsc_xregistry[:dsc_valuename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_valuename' do
    expect{dsc_xregistry[:dsc_valuename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_valuename' do
    expect{dsc_xregistry[:dsc_valuename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_valuedata' do
    dsc_xregistry[:dsc_valuedata] = ["foo", "bar", "spec"]
    expect(dsc_xregistry[:dsc_valuedata]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_valuedata' do
    expect{dsc_xregistry[:dsc_valuedata] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_valuedata' do
    expect{dsc_xregistry[:dsc_valuedata] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_valuetype predefined value String' do
    dsc_xregistry[:dsc_valuetype] = 'String'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('String')
  end

  it 'should accept dsc_valuetype predefined value string' do
    dsc_xregistry[:dsc_valuetype] = 'string'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('string')
  end

  it 'should accept dsc_valuetype predefined value Binary' do
    dsc_xregistry[:dsc_valuetype] = 'Binary'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('Binary')
  end

  it 'should accept dsc_valuetype predefined value binary' do
    dsc_xregistry[:dsc_valuetype] = 'binary'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('binary')
  end

  it 'should accept dsc_valuetype predefined value Dword' do
    dsc_xregistry[:dsc_valuetype] = 'Dword'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('Dword')
  end

  it 'should accept dsc_valuetype predefined value dword' do
    dsc_xregistry[:dsc_valuetype] = 'dword'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('dword')
  end

  it 'should accept dsc_valuetype predefined value Qword' do
    dsc_xregistry[:dsc_valuetype] = 'Qword'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('Qword')
  end

  it 'should accept dsc_valuetype predefined value qword' do
    dsc_xregistry[:dsc_valuetype] = 'qword'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('qword')
  end

  it 'should accept dsc_valuetype predefined value MultiString' do
    dsc_xregistry[:dsc_valuetype] = 'MultiString'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('MultiString')
  end

  it 'should accept dsc_valuetype predefined value multistring' do
    dsc_xregistry[:dsc_valuetype] = 'multistring'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('multistring')
  end

  it 'should accept dsc_valuetype predefined value ExpandString' do
    dsc_xregistry[:dsc_valuetype] = 'ExpandString'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('ExpandString')
  end

  it 'should accept dsc_valuetype predefined value expandstring' do
    dsc_xregistry[:dsc_valuetype] = 'expandstring'
    expect(dsc_xregistry[:dsc_valuetype]).to eq('expandstring')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xregistry[:dsc_valuetype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_valuetype' do
    expect{dsc_xregistry[:dsc_valuetype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_valuetype' do
    expect{dsc_xregistry[:dsc_valuetype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_valuetype' do
    expect{dsc_xregistry[:dsc_valuetype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xregistry[:dsc_ensure] = 'Present'
    expect(dsc_xregistry[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xregistry[:dsc_ensure] = 'present'
    expect(dsc_xregistry[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xregistry[:dsc_ensure] = 'present'
    expect(dsc_xregistry[:ensure]).to eq(dsc_xregistry[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xregistry[:dsc_ensure] = 'Absent'
    expect(dsc_xregistry[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xregistry[:dsc_ensure] = 'absent'
    expect(dsc_xregistry[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xregistry[:dsc_ensure] = 'absent'
    expect(dsc_xregistry[:ensure]).to eq(dsc_xregistry[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xregistry[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xregistry[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xregistry[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xregistry[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hex' do
    expect{dsc_xregistry[:dsc_hex] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_hex" do
    dsc_xregistry[:dsc_hex] = 'true'
    expect(dsc_xregistry[:dsc_hex]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_hex" do
    dsc_xregistry[:dsc_hex] = 'false'
    expect(dsc_xregistry[:dsc_hex]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_hex" do
    dsc_xregistry[:dsc_hex] = 'True'
    expect(dsc_xregistry[:dsc_hex]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_hex" do
    dsc_xregistry[:dsc_hex] = 'False'
    expect(dsc_xregistry[:dsc_hex]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_hex" do
    dsc_xregistry[:dsc_hex] = :true
    expect(dsc_xregistry[:dsc_hex]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_hex" do
    dsc_xregistry[:dsc_hex] = :false
    expect(dsc_xregistry[:dsc_hex]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_hex' do
    expect{dsc_xregistry[:dsc_hex] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_force' do
    expect{dsc_xregistry[:dsc_force] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_force" do
    dsc_xregistry[:dsc_force] = 'true'
    expect(dsc_xregistry[:dsc_force]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('true'))
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_force" do
    dsc_xregistry[:dsc_force] = 'false'
    expect(dsc_xregistry[:dsc_force]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('false'))
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_force" do
    dsc_xregistry[:dsc_force] = 'True'
    expect(dsc_xregistry[:dsc_force]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('True'))
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_force" do
    dsc_xregistry[:dsc_force] = 'False'
    expect(dsc_xregistry[:dsc_force]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean('False'))
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_force" do
    dsc_xregistry[:dsc_force] = :true
    expect(dsc_xregistry[:dsc_force]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:true))
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_force" do
    dsc_xregistry[:dsc_force] = :false
    expect(dsc_xregistry[:dsc_force]).to eq(PuppetX::Dsc::TypeHelpers.munge_boolean(:false))
  end

  it 'should not accept int for dsc_force' do
    expect{dsc_xregistry[:dsc_force] = -16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xregistry)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xregistry)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xregistry.original_parameters[:dsc_ensure] = 'present'
        dsc_xregistry[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xregistry)
      end

      it "should update :ensure to :present" do
        expect(dsc_xregistry[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xregistry.original_parameters[:dsc_ensure] = 'absent'
        dsc_xregistry[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xregistry)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xregistry[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
