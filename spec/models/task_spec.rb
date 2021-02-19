require 'rails_helper'

RSpec.describe Task, type: :model do

  before(:all) do
    @task = Task.create(description: "Vivamus tempus")
  end

  describe 'validations' do
    it 'validates presence of description' do
      @task.validate
      expect(@task.errors[:description]).not_to include("can't be blank")
    end
  end

  describe 'validates CRUD'

    it 'verify that task can be created' do
      expect(@task).to be_valid
    end

    it 'verify that the description can be updated' do
      @task.update(description: "Lorem ac odio")
      expect(Task.find_by_description("Lorem ac odio")).to eq(@task)
    end

end
