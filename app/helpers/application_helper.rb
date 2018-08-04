module ApplicationHelper

    def navbar_link body, url, html_options = {}, &block
    active = 'active' if current_page?(url)
    content_tag :li, class: active do
      link_to url, html_options do
        if block_given? && block.yield
          block.yield << ' ' << body
        else
          body
        end
      end
    end
  end
end
