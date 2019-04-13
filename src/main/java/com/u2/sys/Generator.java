package com.u2.sys;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.ClasspathResourceLoader;

import com.u2.db.manager.TableManager;

public class Generator {

	private static String root="G:/git/seed";//交大
	//private static String root="D:/work/workspace/seed";//公司
	//private static String root="F:/work/git/seed";//家
	private static String path="/src/main/webapp/WEB-INF/page/";
	public void generatorIndex(String fkey) throws IOException{
		
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("com/u2/ftl/");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		
		((TableManager)TableManager.me()).init();
		
		File ff=new File(root+path+fkey);
		if(!ff.exists()){
			ff.mkdirs();
		}
        
        Template it = gt.getTemplate("/index.btl");
        binding(fkey,it);
        outFile(it,root+path+fkey+"/index.jsp");
		
	}
	
	public void generatorAdd(String fkey) throws IOException{
		
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("com/u2/ftl/");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		
		((TableManager)TableManager.me()).init();
		
		File ff=new File(root+path+fkey);
		if(!ff.exists()){
			ff.mkdirs();
		}
		
		
		Template at = gt.getTemplate("/add.btl");
		binding(fkey,at);
		outFile(at,root+path+fkey+"/add.jsp");
		
	}
	
	public void generatorSelect(String fkey) throws IOException{
		
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("com/u2/ftl/");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		
		((TableManager)TableManager.me()).init();
		
		File ff=new File(root+path+fkey);
		if(!ff.exists()){
			ff.mkdirs();
		}
		
		
		Template at = gt.getTemplate("/select.btl");
		binding(fkey,at);
		outFile(at,root+path+fkey+"/select.jsp");
		
	}
	
	
	public void generatorEdit(String fkey) throws IOException{
		
		ClasspathResourceLoader resourceLoader = new ClasspathResourceLoader("com/u2/ftl/");
		Configuration cfg = Configuration.defaultConfiguration();
		GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
		
		((TableManager)TableManager.me()).init();
		
		File ff=new File(root+path+fkey);
		if(!ff.exists()){
			ff.mkdirs();
		}
		
        Template et = gt.getTemplate("/edit.btl");
        binding(fkey,et);
        outFile(et,root+path+fkey+"/edit.jsp");
        
	}
	
	private void binding(String fkey, Template t) {
		// TODO Auto-generated method stub
		t.binding("fkey", fkey);
		t.binding("skeys", createSeeds(fkey));
		Set<String> s = TableManager.me().findSearchSeedKeys(fkey);
		if(s!=null&&!s.isEmpty()){
			t.binding("searchSeeds",s );
		}
		List<String> r = TableManager.me().findRelationKeys(fkey);
		if(r!=null){
			t.binding("relationKeys",r );
		}
		List<String> sub = TableManager.me().findSubKeys(fkey);
		if(sub!=null){
			t.binding("subKeys", sub);
		}
		String p = TableManager.me().findParentKeys(fkey);
		if(p!=null){
			t.binding("parentKey", p);
		}
		
	}
	private Object createSeeds(String fkey) {
		// TODO Auto-generated method stub
		List<String> list = TableManager.me().findSeedskeyList(fkey);
		List<Seed> s=new ArrayList<Seed>();
		for (String k : list) {
			s.add(new Seed(k, TableManager.me().findLength(fkey, k)));
		}
		return s;
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
			new Generator().generatorAll("student");
			new Generator().generatorAll("teacher");
			new Generator().generatorAll("lesson");
			new Generator().generatorAll("price");
			new Generator().generatorAll("period");
			//new Generator().generatorAll("role");
			//new Generator().generatorAll("account");
			//new Generator().generatorAll("menu");
			//new Generator().generatorAll("model");
//			new Generator().generatorAll("demo5");
//			new Generator().generatorAll("demo4");
//			new Generator().generatorAll("demo3");
//			new Generator().generatorAll("demo2");
//			new Generator().generatorAll("demo1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void generatorAll(String key) throws IOException {
		// TODO Auto-generated method stub
		generatorAdd(key);
		generatorEdit(key);
		generatorSelect(key);
		generatorIndex(key);
	}
	private class Seed{
		String key;
		Integer length;
		Seed(String key, Integer length) {
			this.key = key;
			this.length = length;
		}
		@SuppressWarnings("unused")
		public String getKey() {
			return key;
		}
		@SuppressWarnings("unused")
		public void setKey(String key) {
			this.key = key;
		}
		@SuppressWarnings("unused")
		public Integer getLength() {
			return length;
		}
		@SuppressWarnings("unused")
		public void setLength(Integer length) {
			this.length = length;
		}
	}
}
