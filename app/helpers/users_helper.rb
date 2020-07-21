# frozen_string_literal: true

module UsersHelper
  def default_avatar_user(user)
    if user.avatar.blank?
      '/default-user-avatar.png'
    else
      url_for(user.avatar)
    end
  end

  def regex_name_validate
    '^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ' \
    'ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ' \
    'ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$'
  end

  def btn_edit
    if current_user == @user
      link_to 'Edit Users', '#', class: 'text-dark'
    else
      'Follow'
    end
  end

  def unfollow_user(user)
    current_user.followings.find_by(following_id: user.id)
  end

  def user_status(user)
    case user.status
    when User::ACTIVED_STATUS
      'text-success'
    when User::DEACTIVED_STATUS
      'text-warning'
    else
      'text-danger'
    end
  end

  def left_menu_setting_user(test_path)
    return 'text-dark' if request.path == test_path
  end

  def action_show_post_user
    'd-none' if request.path == users_public_path
  end

  def action_edit_post_user
    'd-none' if request.path != users_public_path
  end

  def find_tag_following(tag)
    Tag.find_by(id: tag.following_id)
  end
end
