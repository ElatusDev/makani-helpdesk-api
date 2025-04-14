package com.makani.membership.interfaceadapters;

import com.makani.treasury.membership.MembershipDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MembershipRepository extends JpaRepository<MembershipDataModel, Long> {
}
