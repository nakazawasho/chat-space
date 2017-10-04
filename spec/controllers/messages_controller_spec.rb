require 'rails_helper'

describe MessagesController do
  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'renders the :new template' do
      get 
    end
  end



end
