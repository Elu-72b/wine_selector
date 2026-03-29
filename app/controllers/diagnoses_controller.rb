class DiagnosesController < ApplicationController
  def start
    session[:result] = nil
    session[:description] = nil
    session[:another_result] = nil
    session[:pairing] = nil
    redirect_to diagnoses_question_path(step: 1)
  end

  def question
    @step = params[:step].to_i
    @question = DiagnosisData.find_step(@step)

    redirect_to diagnoses_result_path unless @question
  end

  def answer
    step = params[:step].to_i
    choice_id = params[:choice]

    question = DiagnosisData.find_step(step)
    choice = question[:choices].find { |c| c[:id] == choice_id }

    if choice[:result]
      session[:result] = choice[:result]
      session[:image] = choice[:image]
      session[:description] = choice[:description]
      session[:another_result] = choice[:another_result]
      session[:pairing] = choice[:pairing]
      redirect_to diagnoses_result_path
    else
      redirect_to diagnoses_question_path(step: choice[:next_step])
    end
  end

  def result
    redirect_to root_path and return unless session[:result]

    @result = session[:result]
    @image = session[:image]
    @description = session[:description]
    @another_result = session[:another_result]
    @pairing = session[:pairing]
  end
end
