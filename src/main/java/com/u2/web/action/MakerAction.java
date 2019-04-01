package com.u2.web.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;

import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.ClasspathResourceLoader;

import com.u2.db.cache.Fruit_;
import com.u2.db.cache.MainCache;
import com.u2.db.manager.TableManager;
import com.u2.handler.UpdateHandler;
import com.u2.web.SeedAction;

public class MakerAction extends SeedAction{

	public String makerPages(){
		String id=param("id");
		if(id!=null&&!"".equals(id)){
			
			//Fruit_ f = MainCache.me().getFruit(key, Long.valueOf(id));
			Fruit_ f = MainCache.me().getFruit(Long.valueOf(id));
			
				try {
					maker(f);
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			
			
			return "{\"success\":"+true+",\"message\":\"生成代码成功！\"}";
		}else{
			return "{\"success\":"+false+",\"message\":\"生成代码失败！\"}";
		}
		
	}

	private void maker(Fruit_ f) throws IOException, NumberFormatException, SQLException {
		// TODO Auto-generated method stub
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("com/u2/ftl/");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		
		String fkey=f.getSeeds_map().get("fkey").getValue();
		File ff=new File("G:/git/seed/src/main/webapp/"+fkey);
		if(!ff.exists()){
			ff.mkdirs();
		}
		
		Template add_t = gt.getTemplate("/add.btl");
		binding(add_t,f,fkey);
		outFile(add_t,"G:/git/seed/src/main/webapp/"+fkey+"/add.jsp");
		
        Template edit_t = gt.getTemplate("/edit.btl");
        binding(edit_t,f,fkey);
        outFile(edit_t,"G:/git/seed/src/main/webapp/"+fkey+"/edit.jsp");
        
        Template index_t = gt.getTemplate("/index.btl");
        binding(index_t,f,fkey);
        outFile(index_t,"G:/git/seed/src/main/webapp/"+fkey+"/index.jsp");
       
        
		
	}

	private void outFile(Template t,String fname) throws IOException {
		// TODO Auto-generated method stub
		 File f=new File(fname);
	        if(!f.exists())
	        	f.createNewFile();
	     FileOutputStream out=new FileOutputStream(f);
	     t.renderTo(out);
	     out.flush();
	     out.close();
	}

	private void binding(Template t, Fruit_ f,String fkey) throws NumberFormatException, SQLException {
		// TODO Auto-generated method stub
		
		String sss=f.getSeeds_map().get("sss").getValue();
		t.binding("fkey", fkey);
		t.binding("skeys", TableManager.me().findSeedskey(fkey));
		if(sss!=null&&!"".equals(sss)){
			t.binding("searchSeeds", sss.split(","));
		}
	}
	
}
