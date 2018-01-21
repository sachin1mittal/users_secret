module ApplicationHelper

  def menu_item(name=nil, path="#", *args, &block)
    path = name || path if block_given?
    return if path.eql?(request.original_fullpath)

    options = args.extract_options!
    content_tag :li, :class => is_active?(path, options) do
      if block_given?
        link_to path, options, &block
      else
        link_to name, path, options, &block
      end
    end
  end

end
