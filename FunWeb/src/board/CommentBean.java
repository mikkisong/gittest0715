package board;

import java.sql.Date;
import java.sql.Timestamp;

public class CommentBean {

	private String content;
	private int parent_num;
	private Timestamp date;
	private String id;
	private int idx;
	
	

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getParent_num() {
		return parent_num;
	}

	public void setParent_num(int parent_num) {
		this.parent_num = parent_num;
	}
	
	

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
