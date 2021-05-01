package com.gl.market.product;

public class ReviewVo {
	private String reviewid;
	private String proid;
	private String customid;
	private String title;
	private String contents;
	private int score;
	
	public ReviewVo() {
		// TODO Auto-generated constructor stub
	}

	public ReviewVo(String reviewid, String proid, String customid,
			String title, String contents, int score) {
		super();
		this.reviewid = reviewid;
		this.proid = proid;
		this.customid = customid;
		this.title = title;
		this.contents = contents;
		this.score = score;
	}

	public String getReviewid() {
		return reviewid;
	}

	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
	}

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getCustomid() {
		return customid;
	}

	public void setCustomid(String customid) {
		this.customid = customid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "ReviewVo [reviewid=" + reviewid + ", proid=" + proid
				+ ", customid=" + customid + ", title=" + title + ", contents="
				+ contents + ", score=" + score + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((customid == null) ? 0 : customid.hashCode());
		result = prime * result + ((proid == null) ? 0 : proid.hashCode());
		result = prime * result
				+ ((reviewid == null) ? 0 : reviewid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewVo other = (ReviewVo) obj;
		if (customid == null) {
			if (other.customid != null)
				return false;
		} else if (!customid.equals(other.customid))
			return false;
		if (proid == null) {
			if (other.proid != null)
				return false;
		} else if (!proid.equals(other.proid))
			return false;
		if (reviewid == null) {
			if (other.reviewid != null)
				return false;
		} else if (!reviewid.equals(other.reviewid))
			return false;
		return true;
	}
	
}
