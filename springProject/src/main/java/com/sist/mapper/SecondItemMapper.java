package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

//cate1 사무, cate2 의자 ,cate3 사원용의자
import com.sist.vo.*;

public interface SecondItemMapper {

	@Select("SELECT DISTINCT cate1 FROM secondhand_item ORDER BY cate1")
	public List<String> sCategory();

	@Select("SELECT DISTINCT cate2 FROM secondhand_item WHERE cate1=#{s2}")
	public List<String> sCategory2(String s2);

	@Select("SELECT DISTINCT cate3 FROM secondhand_item WHERE cate2=#{s3}")
	public List<String> sCategory3(String s3);

	// 게시물 수
	@Select("SELECT COUNT(*) FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3}")
	public int secondItemCnt(Map map);

	// 검색 결과 갯수
	@Select({ "<script>" + "SELECT COUNT(*) " + "FROM secondhand_item " + "WHERE "
			+ "<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">" + "<foreach collection=\"fsArr\" item=\"fd\">"
			+ "<trim prefix=\"OR\">" + "<choose>" + "<when test=\"fd=='T'.toString()\">" + "title LIKE '%'||#{ss}||'%'"
			+ "</when>" + "<when test=\"fd=='C'.toString()\">" + "cmt LIKE '%'||#{ss}||'%'" + "</when>" + "</choose>"
			+ "</trim>" + "</foreach>" + "</trim>" + "</script>" })
	public int secondItemFindcnt(Map map); // 매개변수는 1개 (여러개 => ~VO,~Map)
	
	//총페이지
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM secondhand_item "
			+ "WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3}")
	public int secondItemTotalPage(Map map);

	// 검색
	// 찾기 => 동적 쿼리 (마이바티스)
	@Select({ "<script>" + "SELECT no,img,title,price,cmt " + "FROM secondhand_item " + "WHERE "
			+ "<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">" + "<foreach collection=\"fsArr\" item=\"fd\">"
			+ "<trim prefix=\"OR\">" + "<choose>" + "<when test=\"fd=='T'.toString()\">" + "title LIKE '%'||#{ss}||'%'"
			+ "</when>" + "<when test=\"fd=='C'.toString()\">" + "cmt LIKE '%'||#{ss}||'%'" + "</when>" + "</choose>"
			+ "</trim>" + "</foreach>" + "</trim>" + "</script>" })
	public List<SecondItemVO> secondItemFindData(Map map); // 검색 리스트

	// 리스트 출력
		@Select({
			"<script>"
		   +"SELECT no,img,title,price,num "
		   +"FROM (SELECT no,img,title,price,rownum as num "
		   +"FROM (SELECT no,img,title,price "
		   +"<if test='n==1'>"
		   +"FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY no)) "
		   +"WHERE "//기본값
		   +"num BETWEEN #{start} AND #{end} "
		   +"</if>"
		   +"<if test='n==2'>"  //가격높은순
		   +"FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]')))) "
		   +"WHERE "//기본값
		   +"num BETWEEN #{start} AND #{end} "
		   +"</if>"
		   +"<if test='n==3'>"  //가격낮은순
		   +"FROM secondhand_item WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} ORDER BY to_number(REGEXP_REPLACE(price,'[^0-9]'))DESC)) "
		   +"WHERE "//기본값
		   +"num BETWEEN #{start} AND #{end} "
		   +"</if>"		   
		   +"</script>"
		})
		public List<SecondItemVO> categorySelectData(Map map); 
															
	// 추천
	@Select("select no,title,price,img from( " + "select no,title,price,img from secondhand_item "
			+ "WHERE cate1=#{cate1} AND cate2=#{cate2} AND cate3=#{cate3} "
			+ "order by DBMS_RANDOM.RANDOM) where rownum <= 5")
	public List<SecondItemVO> recommendData(Map map); 

	@Insert("INSERT INTO secondhand_item(no,title,price,cate1,cate2,cate3,cmt,seller_id,img) "
	    	   +"VALUES((SELECT NVL(MAX(no)+1,1) FROM secondhand_item),#{title},#{price},#{cate1},#{cate2},#{cate3},#{cmt},#{seller_id},#{img})")
	public void secondItemInsert(SecondItemVO vo);   
	
	@Delete("DELETE FROM secondhand_item WHERE no=#{no}")
	   public void secondItemDelete(int no);
	
	@Select("SELECT no,img,title,cmt,price,cate1,cate2,cate3,NVL(seller_id,'hong')as seller_id FROM secondhand_item WHERE no=#{no}")
	public SecondItemVO secondItemData(int no);

	// 댓글

	// 댓글개수
	@Select("SELECT COUNT(*) FROM reply WHERE item_no=#{item_no} AND cate=#{cate}")
	public int replyCnt(Map map);

	// 댓글가져오기
	@Select("SELECT no,item_no,cate,content,pwd,id,TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss') as dbday " + "FROM reply "
			+ "WHERE item_no=#{item_no} AND cate=#{cate}" + "ORDER BY regdate desc")
	public List<ReplyVO> replyData(Map map);

	// 댓글 입력
	@Insert("INSERT INTO reply(no,item_no,cate,content,pwd,id,regdate) VALUES("
			+ "(SELECT NVL(MAX(no)+1,1) FROM reply),#{item_no},#{cate},#{content},#{pwd},#{id},SYSDATE)")
	public void replyInsert(ReplyVO rvo);

	// 댓글 수정 -> 하는중
	@Update("UPDATE reply SET content=#{content} WHERE no=#{no}")
	public void replyUpdate(Map map);

	// 댓글 삭제
	@Delete("DELETE FROM reply WHERE no=#{no}")
	public void replyDelete(int no);

	//상품번호에 해당하는 카테 가져오기
	@Select("SELECT cate3 FROM secondhand_item WHERE no=#{no}")
	public String noCate(int no);
	
	//새상품 추천
	@Select("SELECT no,img,title,price FROM new_item WHERE cmt LIKE '%'||#{cate}||'%'")
	public List<NewItemVO> newItemFind(String cate);
}

