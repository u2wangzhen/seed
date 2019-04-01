package com.u2.db.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import com.u2.db.CubeI;

public class Cube implements CubeI {
	private static int factor = 10;

	private Fruit_ first;

	private Square[] squares = new Square[factor];

	public Cube() {

		init();
	}

	private void init() {
		// TODO Auto-generated method stub
		for (int j = 0; j < factor; j++) {
			squares[j] = new Square();
		}
	}

	public Cube(int factor) {
		Cube.factor = factor;
		init();
	}

	private Map<String, Square[]> key_map = new HashMap<String, Square[]>();

	/*
	 * public Square[] getFruits(String key){ return key_map.get(key); }
	 */
	public List<Fruit_> getFruitsAsc(String key) {
		if (key != null && !"".equals(key)) {
			Square[] s = key_map.get(key);
			if (s != null && s.length == 2) {
				Square square = s[0];
				if (square != null) {
					List<Fruit_> list = new ArrayList<Fruit_>();
					list.add(square.get());
					Square i = square;
					while (i.hasNext()) {
						i = i.next();
						Fruit_ f = i.get();
						if (f != null) {
							list.add(f);
						}
					}
					return list;
				}
			}
		}
		return null;
	}

	public List<Fruit_> getFruitsDesc(String key) {
		if (key != null && !"".equals(key)) {
			Square[] s = key_map.get(key);
			if (s != null && s.length == 2) {
				Square square = s[1];
				if (square != null) {
					List<Fruit_> list = new ArrayList<Fruit_>();
					list.add(square.get());
					Square i = square;
					while (i.hasPrevious()) {
						i = i.previous();
						Fruit_ f = i.get();
						if (f != null) {
							list.add(f);
						}
					}
					return list;
				}
			}
		}
		return null;
	}

	private class Square {
		Fruit_ fruit;
		Square[] below;

		Square previous;
		Square next;

		void add(Fruit_ f) {
			this.fruit = f;
			String key = f.getKey();
			if (key != null && !"".equals(key)) {
				Square[] ss = key_map.get(key);
				if (ss == null) {
					ss = new Square[2];
					key_map.put(key, ss);
					ss[0] = this;
				}
				if (ss[1] != null) {
					this.previous = ss[1];
					ss[1].next = this;
				}
				ss[1] = this;

			} else {
				throw new RuntimeException("Fruit'key is lost!");
			}
		}

		Fruit_ get() {
			return fruit;
		}

		boolean hasNext() {
			// TODO Auto-generated method stub
			return next != null;
		}

		Square next() {
			// TODO Auto-generated method stub
			return next;
		}

		boolean hasPrevious() {
			// TODO Auto-generated method stub
			return previous != null;
		}

		Square previous() {
			// TODO Auto-generated method stub
			return previous;
		}

		void remove() {
			// TODO Auto-generated method stub

			if (this.next == null) {
				if (this.previous != null) {
					this.previous.next = null;
				} else {
					key_map.remove(fruit.getKey());
				}
			} else {
				if (this.previous != null) {
					this.previous.next = this.next;
					this.next.previous = this.previous;
				} else {
					this.next.previous = null;
					key_map.get(fruit.getKey())[0] = next;
				}
			}
			fruit = null;
		}
	}

	public void add(Fruit_ fruit) {
		Long id = fruit.getId();
		synchronized (id) {
			int[] indexs = fruit.getIndexs();
			if (indexs != null) {
				Square s = indexAndGrowth(indexs);
				s.add(fruit);
			} else {
				if (fruit.getId() != null && fruit.getId() == 0) {
					first = fruit;
				} else {
					throw new RuntimeException("id is null");
				}
			}
		}
	}

	private Square indexAndGrowth(int[] indexs) {
		Square s = null;
		for (int i = 0; i < indexs.length; i++) {
			if (i == 0) {
				s = squares[indexs[0] - 1];
			} else {
				if (s.below == null) {
					s.below = new Square[factor];
					for (int j = 0; j < factor; j++) {
						s.below[j] = new Square();
					}
				}
				s = s.below[indexs[i] - 1];
			}
		}
		return s;
	}

	private Square index(int[] indexs) {
		Square s = null;
		for (int i = 0; i < indexs.length; i++) {
			if (i == 0) {
				s = squares[indexs[0] - 1];
			} else {
				if (s.below != null) {
					s = s.below[indexs[i] - 1];
				}
			}
		}
		return s;
	}

	public Fruit_ get(Long id) {

		if (id != null) {
			if (id == 0) {
				return first;
			} else {
				int[] indexs = buildIndex(id);
				Square s = index(indexs);
				return s == null ? null : s.get();
			}
		}
		return null;
	}

	public void remove(Long id) {
		// TODO Auto-generated method stub
		synchronized (id) {
			if (id != null) {
				if (id == 0) {
					first = null;
				} else {
					int[] indexs = buildIndex(id);
					Square s = index(indexs);
					if (s != null) {
						s.remove();
					}
				}
			}
		}
	}

	public static int[] buildIndex(Long id) {
		// TODO Auto-generated method stub
		Stack<Integer> stack = new Stack<Integer>();
		long cs = id;
		while (cs > 0) {
			int ys = (int) (cs % factor);
			stack.push(ys);
			cs /= factor;
		}
		if (!stack.isEmpty()) {
			int[] indexs = new int[stack.size()];
			for (int i = 0; i < indexs.length; i++) {
				indexs[i] = stack.pop();
			}
			return indexs;
		}
		return null;
	}

}
