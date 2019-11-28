module ApplicationHelper
    def class_string(css_map)
        css_map.find_all(&:last).map(&:first).join(" ")
    end

    def active_if_on(pages)
        "active" if pages.any? {|p| current_page?(p)}
    end
end
