require 'sketchup.rb'
require 'offset.rb'
#查找png图片，获取全路径名
def find_png(file_name="") 
  path=Sketchup.find_support_file file_name,"plugins/image"
  return path
end
module Win
#选择面
	def Win.sel
  	selection=Sketchup.active_model.selection
		#分别成组
  	selection.each do |face|
			face=selection.add_group
  	end
	end
	#弹窗（窗框宽度，厚度，玻璃厚度）
  def Win.form
		prompts=["窗框厚度","窗框厚度","玻璃厚度"]
		val=["","",""]
		results=UI.inputbox prompts,val,"参数"	
		

	end
end
Win
#添加菜单

#"扩展程序"菜单栏
pmenu=UI.menu("Plugins") 
#添加子菜单
submenu=pmenu.add_submenu("窗户") 
submenu.add_item("窗户"){Win}
#添加工具栏
toolbar = UI::Toolbar.new "Windows"
cmd = UI::Command.new("Windows"){Win}
cmd.small_icon =find_png "win.png"
cmd.large_icon =find_png "win.png"
cmd.tooltip = "Windows"
cmd.status_bar_text = "Windows"
cmd.menu_text = "Windows"
toolbar = toolbar.add_item cmd
toolbar.show