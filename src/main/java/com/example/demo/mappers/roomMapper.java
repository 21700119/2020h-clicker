package com.example.demo.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.domain.PtUserVO;
import com.example.demo.domain.RoomVO;

@Repository("com.example.demo.mappers.roomMapper")
public interface roomMapper {
	
	public List<RoomVO> list(String id) throws Exception;
	
	public List<PtUserVO> plist(String id) throws Exception;
	
	public RoomVO roomDetail(int room_id) throws Exception;
	
	public int roomInsert(RoomVO room) throws Exception;
	
	public void enter(RoomVO room) throws Exception;
	
	public int roomDelete1(int room_id) throws Exception;
	
	public int roomDelete2(int room_id) throws Exception;
	
	public int roomDelete3(int room_id) throws Exception;
	
	public int update(PtUserVO room) throws Exception;
	
	public int findId(String code) throws Exception;
	
	public String findName(String code) throws Exception;
	
	public String findMdUser(String code) throws Exception;
	//public List<RoomVO> pplist(String id) throws Exception;
}
