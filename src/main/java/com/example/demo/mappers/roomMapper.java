package com.example.demo.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.domain.RoomVO;

@Repository("com.example.demo.mappers.roomMapper")
public interface roomMapper {
	
	public List<RoomVO> list(String id) throws Exception;
	
	public List<RoomVO> plist(String id) throws Exception;
	
	public RoomVO roomDetail(int room_id) throws Exception;
	
	public int roomInsert(RoomVO room) throws Exception;
	
	public void enter(RoomVO room) throws Exception;
	
	public int roomDelete(int room_id) throws Exception;
	
	public int update(RoomVO room) throws Exception;
}
