require 'compass/import-once/activate'
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "assets/css"
sass_dir = "assets/sass"
images_dir = "assets/images"
javascripts_dir = "assets/js"
fonts_dir = "assets/fonts"

output_style = :expanded
environment = :production

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false
color_output = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass assets/scss scss && rm -rf sass && mv scss sass
preferred_syntax = :scss

# Move style.scss to root folder
require 'fileutils'
on_stylesheet_saved do |file|
  if File.exists?(file) && File.basename(file) == "style.css"
    puts "Moving: #{file}"
    FileUtils.mv(file, File.dirname(file) + "/../../" + File.basename(file))
 end

  if File.exists?(file) && File.basename(file) == "woocommerce.css"
    puts "Moving: #{file}"
    FileUtils.mv(file, File.dirname(file) + "/../../woocommerce/" + File.basename(file))
  end

  if File.exists?(file) && File.basename(file) == "gravityforms-custom.css"
    puts "Moving: #{file}"
    FileUtils.mv(file, File.dirname(file) + "/../../config-gravityforms/" + File.basename(file))
  end
end
