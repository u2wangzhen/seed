package com.u2.db;

import java.util.List;
import java.util.Set;

public interface TableManagerI {

	public int findLength(String fkey, String skey);
	public Set<Integer> findSeedsLength(String fkey);
	public Set<String> findSeedskey(String fkey);
	public Set<String> findSearchSeedKeys(String fkey);
	public List<String> findSeedskeyList(String fkey);
}
