#
# Cookbook:: odoo
# Recipe:: default
#
# Copyright:: 2016, Joel Handwell
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

python_runtime '2.7.12'

ark 'odoo' do
  path '/opt'
  url 'https://nightly.odoo.com/10.0/nightly/src/odoo_10.0.latest.tar.gz'
  action :put
end

include_recipe 'nodejs::nodejs_from_binary'

apt_repository 'yarn' do
  uri 'https://dl.yarnpkg.com/debian/'
  distribution 'stable'
  components ['main']
  key 'https://dl.yarnpkg.com/debian/pubkey.gpg'
end

package 'yarn'

execute 'yarn global add less'
