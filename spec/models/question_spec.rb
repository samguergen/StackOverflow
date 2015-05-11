require 'spec_helper'

describe Question do
  it "title should be automatically titleized before save" do
    question = Question.new
    question.title   = "new Question!"
    question.content = "A great story"

    question.save
    expect(question.title).to eq("New Question!")
  end
end