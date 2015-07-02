class LanguageRelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create

    if params[:fluent].present?
      @language = Language.find_or_create_by(english: params[:fluent][:language])

      current_user.language_relationships.new(language_id: @language.id, relationship: 'fluent').save
      render :create
    else
      @language = Language.find_or_create_by(english: params[:learning][:language])

      current_user.language_relationships.new(language_id: @language.id, relationship: 'learning').save
      render :create
    end
  end

  def destroy
    LanguageRelationship.find(params[:id]).destroy
    render :destroy
  end

end
