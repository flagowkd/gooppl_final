package goo.review.model;

import java.util.*;

public interface ReviewService {

	public int writeReview(ReviewDTO dto);
	public List<ReviewDTO> reviewList(int cp,int ls);
	public ReviewDTO reviewContent(int idx);
	public int getTotalCnt();
}