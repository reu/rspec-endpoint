require "spec_helper"

RSpec.describe RSpec::Endpoint do
  describe "#endpoint" do
    endpoint "POST /users/:user_id/comments/:comment_id" do
      let(:user_id) { 10 }
      let(:comment_id) { 20 }

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
