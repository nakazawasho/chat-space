require 'rails_helper'

#メッセージコントローラーのテスト
describe MessagesController do

  #メッセージ一覧ページを表示するアクション
  describe 'GET #new' do
    #ログインしている場合
    let(:user){ create(:user) }
    let(:group){ user.groups.first }

    context 'you are logged in' do
      #ログインしている状態を作る
      before :each do
        login_user user
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
        expect(assigns(:group)).to eq group
      end

      #@messagesに正しく値がはいっているか
      it 'assigns the requested messages to @messages' do
        messages = group.messages
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
        get :new, group_id: group
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  #メッセージを作成するアクション
  describe 'POST #create' do
    let(:user){ create(:user) }
    let(:group){ user.groups.first }
    subject {
      Proc.new { post :create, message: attributes_for(:message), group_id: group }
    }
    #ログインしているかつ、保存に成功した場合
    context 'you are logged in' do
      before :each do
        login_user user
      end
      context 'succeed in preserving a new data' do
        #メッセージの保存はできたのか
        it 'saves the new message in the database' do
          expect{ subject.call }.to change(Message, :count).by(1)
        end

        #意図した画面に遷移しているか
        it 'redirects to the new page upon save' do
          subject.call
          expect(response).to redirect_to(new_group_message_path)
        end
      end

      #ログインしているが、保存に失敗した場合
      context 'unsucceed in preserving a new data' do
        #メッセージの保存は行われなかったか
        it 'dose not save the new message in the database' do
          expect{ post :create, message: attributes_for(:message, content: nil, image: nil), group_id: group
          }.not_to change(Message, :count)
        end

        #意図したビューが描画されているか
        it 're-renders the index template' do
          post :create, message: attributes_for(:message, content: nil, image: nil), group_id: group
          expect(response).to render_template :new
        end

        it 'shows a flash message' do
          post :create, message: attributes_for(:message, content: nil, image: nil), group_id: group
          expect(flash[:alert]).to be_present
        end
      end
    end

    #ログインしていない場合
    context 'you are not logged in' do
      #意図した画面にリダイレクトできているか
      it 'blocks unauthenticated access' do
        post :create, group_id: group
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
