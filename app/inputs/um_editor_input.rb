class UmEditorInput
  include Formtastic::Inputs::Base
  def to_html
    html = <<-SCRIPT
      <script type="text/javascript">
        $(function(){
            window.um = UM.getEditor('container', {
                /* 传入配置参数,可配参数列表看umeditor.config.js */
                toolbar: ['undo redo | bold italic underline']
            });
        });
      </script>
    SCRIPT


    html << '<script id="container" name="reference[content]" type="text/plain" style="width:800px;height:200px;">'
    html << (options[:input_html].try(:[], :value) || @object.send(method)).to_s
    html << '</script>'

    input_wrapping do
      label_html << html.html_safe
    end
  end
end
