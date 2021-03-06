module ApplicationConfiguration
  require 'ostruct'
  require 'yaml'  
  if File.exists?( File.join(Rails.root, 'config', 'application.yml') )
    file = File.join(Rails.root, 'config', 'application.yml')
    users_app_config = YAML.load_file file
  end
  
  ::AppConfig = OpenStruct.new users_app_config
end

AppConfig.advanced_mce_options = {
    :theme => 'advanced',
    :browsers => %w{msie gecko safari},
    :theme_advanced_layout_manager => "SimpleLayout",
    :theme_advanced_statusbar_location => "bottom",
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "left",
    :theme_advanced_resizing => true,
    :relative_urls => false,
    :convert_urls => false,
    :cleanup => true,
    :cleanup_on_startup => true,  
    :convert_fonts_to_spans => true,
    :theme_advanced_resize_horizontal => false,
    :theme_advanced_buttons1 => %w{formatselect fontsizeselect bold italic underline forecolor backcolor separator justifyleft justifycenter justifyright indent outdent separator bullist numlist separator link unlink image media separator undo redo help code separator pasteword},
    :theme_advanced_buttons2 => [],
    :theme_advanced_buttons3 => [],
    
    :plugins => %w{media preview *curblyadvimage* inlinepopups safari paste}, 
    :plugin_preview_pageurl => '../../../../../posts/preview',
    :plugin_preview_width => "950",
    :plugin_preview_height => "650",    
    :editor_selector => "mceEditor",
    :extended_valid_elements => "img[class|src|flashvars|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name|obj|param|embed|scale|wmode|salign|style],embed[src|quality|scale|salign|wmode|bgcolor|width|height|name|align|type|pluginspage|flashvars],object[align<bottom?left?middle?right?top|archive|border|class|classid|codebase|codetype|data|declare|dir<ltr?rtl|height|hspace|id|lang|name|style|tabindex|title|type|usemap|vspace|width]"
  }

AppConfig.default_mce_options = {
  :theme => 'advanced',
  :browsers => %w{msie gecko safari},
  :theme_advanced_layout_manager => "SimpleLayout",
  :theme_advanced_statusbar_location => "bottom",
  :theme_advanced_toolbar_location => "top",
  :theme_advanced_toolbar_align => "left",
  :theme_advanced_resizing => true,
  :relative_urls => false,
  :convert_urls => false,
  :cleanup => true,
  :cleanup_on_startup => true,  
  :convert_fonts_to_spans => true,
  :theme_advanced_resize_horizontal => false,
  :theme_advanced_buttons1 => %w{bold italic underline separator justifyleft justifycenter justifyright indent outdent separator bullist numlist separator link unlink image media separator undo redo help code separator pasteword},
  :theme_advanced_buttons2 => [],
  :theme_advanced_buttons3 => [],
  :plugins => %w{media preview curblyadvimage inlinepopups safari paste},
  :plugin_preview_pageurl => '../../../../../posts/preview',
  :plugin_preview_width => "950",
  :plugin_preview_height => "650",
  :plugin_media_handler_url => '/attachments/manage',
  :editor_selector => "mceEditor",
  :extended_valid_elements => "img[class|src|flashvars|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name|obj|param|embed|scale|wmode|salign|style],embed[src|quality|scale|salign|wmode|bgcolor|width|height|name|align|type|pluginspage|flashvars],object[align<bottom?left?middle?right?top|archive|border|class|classid|codebase|codetype|data|declare|dir<ltr?rtl|height|hspace|id|lang|name|style|tabindex|title|type|usemap|vspace|width]"  
  }
  
AppConfig.simple_mce_options = {
  :theme => 'advanced',
  :browsers => %w{msie gecko safari},
  :cleanup_on_startup => true,
  :convert_fonts_to_spans => true,
  :theme_advanced_resizing => true, 
  :theme_advanced_toolbar_location => "top",  
  :theme_advanced_statusbar_location => "bottom", 
  :editor_deselector => "mceNoEditor",
  :theme_advanced_resize_horizontal => false,  
  :theme_advanced_buttons1 => %w{bold italic underline separator bullist numlist separator link unlink image separator help separator pasteword},
  :theme_advanced_buttons2 => [],
  :theme_advanced_buttons3 => [],
  :plugins => %w{inlinepopups safari curblyadvimage paste}
  }
  
 Tinymce::Hammer.install_path  

    '/javascripts/tiny_mce'

 Tinymce::Hammer.plugins       

    ['paste']

 Tinymce::Hammer.languages     

    ['en']
 Tinymce::Hammer.themes        

    ['advanced']

 Tinymce::Hammer.init          

    [
      [:paste_convert_headers_to_strong, true],
      [:paste_convert_middot_lists, true],
      [:paste_remove_spans, true],
      [:paste_remove_styles, true],
      [:paste_strip_class_attributes, true],
      [:theme, 'advanced'],
      [:theme_advanced_toolbar_align, 'left'],
      [:theme_advanced_toolbar_location, 'top'],
      [:theme_advanced_buttons1, 'undo,redo,cut,copy,paste,pastetext,|,bold,italic,strikethrough,blockquote,charmap,bullist,numlist,removeformat,|,link,unlink,image,|,cleanup,code'],
      [:theme_advanced_buttons2, ''],
      [:theme_advanced_buttons3, ''],
      [:valid_elements, "a[href|title],blockquote[cite],br,caption,cite,code,dl,dt,dd,em,i,img[src|alt|title|width|height|align],li,ol,p,pre,q[cite],small,strike,strong/b,sub,sup,u,ul"],
    ]

#NOTE: install_path is the path inside public to your TinyMCE installation.

#NOTE: please don't set the <tt>mode</tt> option for the init.  This is managed
#by tinymce_hammer.  If this doesn't work for your, try the advanced usage.



  Tinymce::Hammer.install_path = '/javascripts/lib/tiny_mce'

  Tinymce::Hammer.plugins = %w(safari table paste tabfocus)

  Tinymce::Hammer.init = [
    [:paste_convert_headers_to_strong, true],
    [:paste_convert_middot_lists, true],
    [:paste_remove_spans, true],
    [:paste_remove_styles, true],
    [:paste_strip_class_attributes, true],
    [:theme, 'advanced'],
    [:theme_advanced_toolbar_align, 'left'],
    [:theme_advanced_toolbar_location, 'top'],
    [:theme_advanced_buttons1, 'undo,redo,cut,copy,paste,pastetext,|,bold,italic,strikethrough,blockquote,charmap,bullist,numlist,removeformat,|,link,unlink,image,|,cleanup,code'],
    [:theme_advanced_buttons2, ''],
    [:theme_advanced_buttons3, ''],
    [:valid_elements, "a[href|title],blockquote[cite],br,caption,cite,code,dl,dt,dd,em,i,img[src|alt|title|width|height|align],li,ol,p,pre,q[cite],small,strike,strong/b,sub,sup,u,ul"],
  ]

