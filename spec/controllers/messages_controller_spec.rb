require 'rails_helper'

#メッセージコントローラーのテスト
describe MessagesController do

  #メッセージ一覧ページを表示するアクション
  describe 'GET #new' do
    #ログインしている場合
    context 'you are logged in' do
      #ログインしている状態を作る
      let(:user){ create(:user) }
      before :each do
        login_user user
        group = user.groups.first.id
        get :new, group_id: group
      end

      #該当するビューが描画されているか
      it 'renders the :new template' do
        expect(response).to render_template :new
      end

      #groupsに正しく値がはいっているか
      it 'assigns the requested groups to @groups' do
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      #@groupに正しく値がはいっているか
      it 'assigns the requested group to @group' do
        group = user.groups.first
        expect(assigns(:group)).to eq group
      end

      #@messagesに正しく値がはいっているか
      it 'assigns the requested messages to @messages' do
        messages = user.groups.first.messages
        expect(assigns(:messages)).to eq messages
      end

      #@messageに正しく値がはいっているか
      it 'assigns the requested message to @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      #@usersに正しく値がはいっているか
      it 'assigns the requested users to @users' do
        users = user.groups.first.users
        expect(assigns(:users)).to eq users
      end
    end

    #ログインしていない場合
    context 'you are not logged in' do
      #意図したビューにリダイレクトできているか
      it "blocks unauthenticated access" do
        user = create(:user)
        sign_out :user
        group = user.groups.first.id
        get :new, group_id: group
        expect(response).to redirect_to(new_user_session_path)
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
