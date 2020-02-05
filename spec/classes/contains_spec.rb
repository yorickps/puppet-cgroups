# To check the correct dependancies are set up for cgroups

require 'spec_helper'

on_supported_os.each do |os, f|
  context "on #{os}" do
    let(:facts) do
      f.merge(super())
    end

    it { is_expected.to compile.with_all_deps }
    describe 'Testing the dependancies between the classes' do
      it { is_expected.to contain_class('cgroups::install') }
      it { is_expected.to contain_class('cgroups::config') }
      it { is_expected.to contain_class('cgroups::service') }
      it { is_expected.to contain_class('cgroups::install').that_comes_before('Class[cgroups::config]') }
      it { is_expected.to contain_class('cgroups::service').that_subscribes_to('Class[cgroups::config]') }
    end
  end
end
