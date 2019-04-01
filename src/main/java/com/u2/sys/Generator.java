package com.u2.sys;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Set;

import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.ClasspathResourceLoader;

import com.u2.db.manager.TableManager;

public class Generator {

	//private static String root="G:/git/seed";
	private static String root="D:/work/workspace/seed";
	
	public void generator(String fkey) throws IOException{
		
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("com/u2/ftl/");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		
		((TableManager)TableManager.me()).init();
		
		File ff=new File(root+"/src/main/webapp/"+fkey);
		if(!ff.exists()){
			ff.mkdirs();
		}
		
		
		Template at = gt.getTemplate("/add.btl");
		binding(fkey,at);
		outFile(at,root+"/src/main/webapp/"+fkey+"/add.jsp");
		
        Template et = gt.getTemplate("/edit.btl");
        binding(fkey,et);
        outFile(et,root+"/src/main/webapp/"+fkey+"/edit.jsp");
        
        Template it = gt.getTemplate("/index.btl");
        binding(fkey,it);
        outFile(it,root+"/src/main/webapp/"+fkey+"/index.jsp");
		
	}
	private void binding(String fkey, Template t) {
		// TODO Auto-generated method stub
		t.binding("fkey", fkey);
		t.binding("skeys", TableManager.me().findSeedskeyList(fkey));
		Set<String> sss = TableManager.me().findSearchSeedKeys(fkey);
		if(sss!=null&&!"".equals(sss)){
			t.binding("searchSeeds", sss);
		}
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
	public static void main(String[] args) {
		try {
			new Generator().generator("student");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
