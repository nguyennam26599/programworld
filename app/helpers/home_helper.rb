# frozen_string_literal: true

module HomeHelper
  def sidebar_admin_icon
    '<div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>'.html_safe
  end
end
