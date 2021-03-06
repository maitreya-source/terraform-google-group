# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

control "gcloud" do
  title "gcloud"

  describe command("gcloud beta identity groups describe group-module-test-group-#{attribute("suffix")}@#{attribute("domain")} --project=#{attribute("project_id")}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }
  end

  describe command("gcloud beta identity groups describe group-module-test-inner-group-#{attribute("suffix")}@#{attribute("domain")} --project=#{attribute("project_id")}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }
  end

  describe command("gcloud beta identity groups memberships describe --group-email group-module-test-group-#{attribute("suffix")}@#{attribute("domain")} --member-email group-module-test-inner-group-#{attribute("suffix")}@#{attribute("domain")} --project=#{attribute("project_id")}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }
  end

  describe command("gcloud beta identity groups memberships describe --group-email group-module-test-inner-group-#{attribute("suffix")}@#{attribute("domain")} --member-email example-manager@#{attribute("project_id")}.iam.gserviceaccount.com --project=#{attribute("project_id")}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }
  end

  describe command("gcloud beta identity groups memberships describe --group-email group-module-test-inner-group-#{attribute("suffix")}@#{attribute("domain")} --member-email example-member@#{attribute("project_id")}.iam.gserviceaccount.com --project=#{attribute("project_id")}") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }
  end

end

