package com.u2.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {

	public static void main(String[] args) {
		
		
		String str=new String("str");
		
		ArrayList<String> list=new ArrayList<String>();
		list.add(str);
		ArrayList<String> a = (ArrayList<String>) list.clone();
		System.out.println(a.get(0));
		list.remove(0);
		System.out.println(a.get(0));
		System.out.println(list.get(0));
		//str.c
		
		
		/*ActionType a = ActionType.valueOf("cc");
		System.out.println(a);*/
		/*final Ccc c=new Ccc();
		int i=0;
		while(true){
			i++;
			
			new Thread(new Runnable() {
				
				public void run() {
					// TODO Auto-generated method stub
					c.see(100L);
				}
			}).start();;
			
			new Thread(new Runnable() {
				
				public void run() {
					// TODO Auto-generated method stub
					c.del(110L);
				}
			}).start();;
			if(i>100){
				break;
			}
		}*/
		
		
	}
}
 /*class Ccc{
	 private Long[] ll=new Long[1];
	 public void see(Long l){
		 synchronized(l){
			 ll[0]=l;
			 System.out.println("in");
			 try {
				Thread.sleep(10);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 if(ll[0]==null){
				 System.out.println("this is null");
			 }
		 }
		
	 }
	 public void del(Long l){
		 synchronized(l){
			 System.out.println("out");
		 ll[0]=null;
		 }
	 }
 }*/