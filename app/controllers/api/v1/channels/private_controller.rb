class Api::V1::Channels::PrivateController < ApplicationController
  def show
    channel = PrivateChannel.find_by(name: params[:channel_name])
    if channel.present?
      channel.destroy!
    else
      PrivateChannel.find_or_create_by!(name: params[:channel_name])
    end

    head :ok
  end
end
