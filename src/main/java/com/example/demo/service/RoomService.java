package com.example.demo.service;

import java.util.List;

import com.example.demo.domain.PtUserVO;
import com.example.demo.domain.RoomVO;

public interface RoomService {

	public List<RoomVO> list(String id) throws Exception;
	
	public List<PtUserVO> plist(String id) throws Exception;
	
	public RoomVO roomDetail(int room_id) throws Exception;
	
	public int roomInsert(RoomVO room) throws Exception;
	
	public int roomDelete1(int room_id) throws Exception;
	
	public int roomDelete2(int room_id) throws Exception;
	
	public int roomDelete3(int room_id) throws Exception;
	
	public int update(PtUserVO room) throws Exception;

	//public List<RoomVO> pplist(String id) throws Exception;
}
