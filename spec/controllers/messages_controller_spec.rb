require 'rails_helper'

#メッセージコントローラーのテスト
describe MessagesController do

  #メッセージ一覧ページを表示するアクション
  describe 'GET #new' do
    #ログインしている場合
    context 'you are logged in' do
      #該当するビューが描画されているか
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end

      #@groupsに正しく値がはいっているか
      it 'assigns the requested groups to @groups' do
      end

      #@groupに正しく値がはいっているか
      it 'assigns the requested group to @group' do
      end

      #@messagesに正しく値がはいっているか
      it 'assigns the requested messages to @messages' do
      end

      #@messageに正しく値がはいっているか
      it 'assigns the requested message to @message' do
      end

      #usersに正しく値がはいっているか
      it 'assigns the requested users to @users' do
      end
    end

    #ログインしていない場合
    context 'you are not logged in' do
      #意図したビューにリダイレクトできているか
      it '' do
      end
    end
  end

  #メッセージを作成するアクション
  describe 'POST #create' do
    #ログインしているかつ、保存に成功した場合
    context 'you are logged in & succeed in preserving a new data' do
      #メッセージの保存はできたのか
      it 'renders the :new template' do
      end

      #意図した画面に遷移しているか
      it 'redirects to index' do
      end
    end

    #ログインしているが、保存に失敗した場合
    context 'you are logged in but unsucceed in preserving a new data' do
      #メッセージの保存は行われなかったか
      it '' do
      end

      #意図したビューが描画されているか
      it 're-renders the index template' do
      end
    end

    #ログインしていない場合
    context 'you are not logged in' do
      #意図した画面にリダイレクトできているか
      it '' do
      end
    end
  end

end
