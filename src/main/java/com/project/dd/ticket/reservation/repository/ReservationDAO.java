package com.project.dd.ticket.reservation.repository;

import java.util.List;
import java.util.Map;

import com.project.dd.pb.benefit.domain.BenefitDTO;
import com.project.dd.pb.price.domain.PriceDTO;
import com.project.dd.ticket.reservation.domain.TicketReservationDTO;

public interface ReservationDAO {

	int reservation(TicketReservationDTO dto);

	String getSeq();

	int addUserBook(Map<String, String> map);

	List<BenefitDTO> getBenefit(String string);

	PriceDTO getPrice(String type, String age);

}
