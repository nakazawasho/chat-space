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
      let(:user){ create(:user) }
      before :each do
        login_user user
      end

      #メッセージの保存はできたのか
      it 'saves the new message in the database' do
        group = user.groups.first.id
        expect{ post :create, message: attributes_for(:message), group_id: group
        }.to change(Message, :count).by(1)
      end

      #意図した画面に遷移しているか
      it 'redirects to the new page upon save' do
        group = user.groups.first.id
        post :create, message: attributes_for(:message), group_id: group
        expect(response).to redirect_to(new_group_message_path)
      end
    end

    #ログインしているが、保存に失敗した場合
    context 'you are logged in but unsucceed in preserving a new data' do
      let(:user){ create(:user) }
      before :each do
        login_user user
      end
      #メッセージの保存は行われなかったか
      it 'dose not save the new message in the database' do
        group = user.groups.first.id
        expect{ post :create, message: attributes_for(:message, content: nil, image: nil), group_id: group
        }.not_to change(Message, :count)
      end

      #意図したビューが描画されているか
      it 're-renders the index template' do
        group = user.groups.first.id
        post :create, message: attributes_for(:message, content: nil, image: nil), group_id: group
        expect(response).to render_template :new
      end
    end

    #ログインしていない場合
    context 'you are not logged in' do
      #意図した画面にリダイレクトできているか
      it 'blocks unauthenticated access' do
        user = create(:user)
        group = user.groups.first.id
        post :create, group_id: group
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
