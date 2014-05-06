require "spec_helper"

describe Project do
  it "should allow a name and description" do
    project = Project.create!(name: "Yeah", description: "so much yes")

    expect(project.name).to eq("Yeah")
    expect(project.description).to eq("sfdafdsao much yes")
  end
end