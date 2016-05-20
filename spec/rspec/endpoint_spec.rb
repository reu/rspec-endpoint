require "spec_helper"

RSpec.describe RSpec::Endpoint do
  describe "#endpoint" do
    endpoint "POST /users/:user_id/comments/:comment_id" do
      let(:user_id) { 10 }
      let(:comment_id) { 20 }

      before { allow(self).to receive(:post) }

      it "has a named subject" do
        expect { make_request }.to_not raise_error
      end

      it "makes a request" do
        subject

        expect(self).to have_received(:post).with(path, user_id: user_id, comment_id: comment_id)
      end

      describe "#params" do
        subject { params }
        it { is_expected.to include user_id: 10 }
        it { is_expected.to include comment_id: 20 }
      end

      describe "#path" do
        subject { path }
        it { is_expected.to eq "/users/10/comments/20" }
      end
    end
  end
end
