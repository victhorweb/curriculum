# encoding: utf-8
class AvaliablesController < ApplicationController
  before_filter :logged?

  def index
    @testes = []
    @inscrition = Inscrition.new(person_id: session[:id], vacant_id: session[:vacant],status_id: '1')
    @inscrition.save
    @number = 0
    params[:skills].each do |key,value|

      @avaliable = Avaliable.new(person_id: session[:id], skill_id: key, level_id: value, vacant_id: session[:vacant])
      if !@avaliable.save
        flash[:notice] = "Não foi possivel salvar..."
      else
        flash[:notice] = "Registro Salvo"
       end
       p @testes << Essay.where(skill_id: key, level_id: value).random
     end
     @testes.flatten!
  end

  def finalization
    @number = 0
    params[:replay].each do |question,response|
      @number = @number + 1
      @finalization = PersonQuestion.new(person_id: session[:id],essay_id: question, replay: response, vacant_id: session[:vacant])
      if !@finalization.save
         flash[:notice] = "Não foi possivel salvar...por favor tente mais tarde"
      else
        @correction = Correction.new( number: @number,validing: 'false', person_question_id: PersonQuestion.last.id)
        if !@correction.save
          flash[:notice] = "Não foi possivel salvar...por favor tente mais tarde"
        end
      end
   end
  end

end