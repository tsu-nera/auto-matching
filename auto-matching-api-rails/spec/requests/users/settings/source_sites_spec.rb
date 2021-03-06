require "rails_helper"

RSpec.describe Api::Users::Settings::SourceSitesController, type: :request do
  let(:target) { build(:source_site, id: 1) }

  describe "#index" do
    subject { get api_users_settings_source_sites_path }

    before do
      create(:source_site, key: SourceSite::KEY_HAPPY_MAIL)
      subject
    end

    context "正常系" do
      it "レスポンスステータスが200であること" do
        expect(response).to have_http_status(200)
        expect(json["data"].length).to eq(SourceSite.count)
      end
    end
  end

  describe "#update" do
    let(:params) { { login_user: "", login_password: "", activate_flag: true, key: SourceSite::KEY_HAPPY_MAIL } }
    subject { put api_users_settings_source_site_path(target), params: params }

    before do
      create(:source_site, key: SourceSite::KEY_HAPPY_MAIL)
      subject
    end

    context "正常系" do
      context "空パラメータの場合" do
        it "レスポンスコードが200であること" do
          expect(response).to have_http_status(200)
        end

        it "空パラメータでクリアされていること" do
          source_site = SourceSite.first
          expect(source_site.login_user).to be_blank
          expect(source_site.login_password).to be_blank
        end
      end

      context "パラメータありの場合(email)" do
        let(:params) { { login_user: "tsu-nera@gmail.com", login_password: "tsu-nera", activate_flag: true, key: SourceSite::KEY_HAPPY_MAIL } }

        it "レスポンスコードが200であること" do
          expect(response).to have_http_status(200)
        end

        it "パラメータが設定されていること" do
          source_site = SourceSite.first
          expect(source_site.login_user).to eq(params[:login_user])
          expect(source_site.login_password).to eq(params[:login_password])
        end
      end

      context "パラメータありの場合(phone)" do
        let(:params) { { login_user: "08012345678", login_password: "tsu-nera", activate_flag: true, key: SourceSite::KEY_HAPPY_MAIL } }

        it "レスポンスコードが200であること" do
          expect(response).to have_http_status(200)
        end

        it "パラメータが設定されていること" do
          source_site = SourceSite.first
          expect(source_site.login_user).to eq(params[:login_user])
          expect(source_site.login_password).to eq(params[:login_password])
        end
      end
    end

    context "異常系" do
      context "ユーザ名が不正な場合" do
        let(:params) { { login_user: "tsu-nera", login_password: "tsu-nera", activate_flag: true, key: SourceSite::KEY_HAPPY_MAIL } }

        it "レスポンスコードが400であること" do
          expect(response).to have_http_status(400)
        end
      end
    end
  end
end
