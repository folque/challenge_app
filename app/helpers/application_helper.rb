module ApplicationHelper

  def question_has_accepted_answer(question)
    question.answers.each do |answer|
      if answer.accepted?
        return true
      end
    end
    return false
  end
end
