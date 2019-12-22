package com.u2.db;

import java.util.List;
import java.util.Set;

public interface TableManagerI {

	public int findLength(String fkey, String skey);
	public Set<Integer> findSeedsLength(String fkey);
	public Set<String> findSeedskey(String fkey);
	public Set<String> findSearchSeedKeys(String fkey);
	public List<String> findSeedskeyList(String fkey);
	public Set<String> findAllFruitKey();
	public String findParentKeys(String fkey);
	public List<String> findRelationKeys(String fkey);
	public List<String> findSubKeys(String fkey);
	public boolean isFirst();
}
