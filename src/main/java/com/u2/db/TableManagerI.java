package com.u2.db;

import java.util.Set;

public interface TableManagerI {

	public void init();
	public int findLength(String fkey, String skey);
	public Set<Integer> findSeedsLength(String fkey);
	public Set<String> findSeedskey(String fkey);
}
