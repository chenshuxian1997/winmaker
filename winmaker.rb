require 'sketchup.rb'
require 'offset.rb'
def find_png(file_name="") #查找png图片，获取全路径名
	path=Sketchup.find_support_file file_name,"plugins/image"
	return path
end
module Win
#选择面
	def win.sel
	selection=Sketchup.active.model_selection
	#分别成组
	selection.each do |face|
		face=selection.add_group
	end
	end
	#弹窗（窗框宽度，厚度，玻璃厚度）
	def win.form
		prompts=["窗框厚度","窗框厚度","玻璃厚度"]
		defults=["","",""]
		results=inputbox prompts,defults,"参数"	
	end
end
#添加菜单
pmenu=UI.menu("Plugins") #"扩展程序"菜单栏
submenu=pmenu.add_submenu("窗户") #添加子菜单
submenu.add_item("rubyconsole"){win}
#添加工具栏
toolbar = UI::Toolbar.new "Windows"
cmd = UI::Command.new("Windows"){win}
cmd.small_icon =find_png "win.png"
cmd.large_icon =find_png "win.png"
cmd.tooltip = "Windows"
cmd.status_bar_text = "Windows"
cmd.menu_text = "Windows"
toolbar = toolbar.add_item cmd
toolbar.show