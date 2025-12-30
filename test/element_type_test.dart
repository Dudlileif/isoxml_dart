// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
import 'package:isoxml_dart/iso_11783_xml_elements.dart';
import 'package:test/test.dart';

void main() {
  test('Element types have correct XML tags', () {
    expect(Iso11783ElementType.allocationStamp.xmlTag, 'ASP');
    expect(Iso11783ElementType.attachedFile.xmlTag, 'AFE');
    expect(Iso11783ElementType.baseStation.xmlTag, 'BSN');
    expect(Iso11783ElementType.codedComment.xmlTag, 'CCT');
    expect(Iso11783ElementType.codedCommentGroup.xmlTag, 'CCG');
    expect(Iso11783ElementType.codedCommentListValue.xmlTag, 'CCL');
    expect(Iso11783ElementType.colourLegend.xmlTag, 'CLD');
    expect(Iso11783ElementType.colourRange.xmlTag, 'CRG');
    expect(Iso11783ElementType.commentAllocation.xmlTag, 'CAN');
    expect(Iso11783ElementType.connection.xmlTag, 'CNN');
    expect(Iso11783ElementType.controlAssignment.xmlTag, 'CAT');
    expect(Iso11783ElementType.cropType.xmlTag, 'CTP');
    expect(Iso11783ElementType.cropVariety.xmlTag, 'CVT');
    expect(Iso11783ElementType.culturalPractice.xmlTag, 'CPC');
    expect(Iso11783ElementType.customer.xmlTag, 'CTR');
    expect(Iso11783ElementType.dataLogTrigger.xmlTag, 'DLT');
    expect(Iso11783ElementType.dataLogValue.xmlTag, 'DLV');
    expect(Iso11783ElementType.device.xmlTag, 'DVC');
    expect(Iso11783ElementType.deviceAllocation.xmlTag, 'DAN');
    expect(Iso11783ElementType.deviceElement.xmlTag, 'DET');
    expect(Iso11783ElementType.deviceObjectReference.xmlTag, 'DOR');
    expect(Iso11783ElementType.deviceProperty.xmlTag, 'DPT');
    expect(Iso11783ElementType.deviceValuePresentation.xmlTag, 'DVP');
    expect(Iso11783ElementType.externalFileContents.xmlTag, 'XFC');
    expect(Iso11783ElementType.externalFileReference.xmlTag, 'XFR');
    expect(Iso11783ElementType.farm.xmlTag, 'FRM');
    expect(Iso11783ElementType.grid.xmlTag, 'GRD');
    expect(Iso11783ElementType.guidanceAllocation.xmlTag, 'GAN');
    expect(Iso11783ElementType.guidanceGroup.xmlTag, 'GGP');
    expect(Iso11783ElementType.guidancePattern.xmlTag, 'GPN');
    expect(Iso11783ElementType.guidanceShift.xmlTag, 'GST');
    expect(Iso11783ElementType.lineString.xmlTag, 'LSG');
    expect(Iso11783ElementType.link.xmlTag, 'LNK');
    expect(Iso11783ElementType.linkGroup.xmlTag, 'LGP');
    expect(Iso11783ElementType.linkList.xmlTag, 'ISO11783LinkList');
    expect(Iso11783ElementType.operationTechnique.xmlTag, 'OTQ');
    expect(Iso11783ElementType.operationTechniquePractice.xmlTag, 'OTP');
    expect(Iso11783ElementType.operationTechniqueReference.xmlTag, 'OTR');
    expect(Iso11783ElementType.partfield.xmlTag, 'PFD');
    expect(Iso11783ElementType.polygon.xmlTag, 'PLN');
    expect(Iso11783ElementType.point.xmlTag, 'PNT');
    expect(Iso11783ElementType.position.xmlTag, 'PTN');
    expect(Iso11783ElementType.processDataVariable.xmlTag, 'PDV');
    expect(Iso11783ElementType.product.xmlTag, 'PDT');
    expect(Iso11783ElementType.productAllocation.xmlTag, 'PAN');
    expect(Iso11783ElementType.productGroup.xmlTag, 'PGP');
    expect(Iso11783ElementType.productRelation.xmlTag, 'PRN');
    expect(Iso11783ElementType.task.xmlTag, 'TSK');
    expect(Iso11783ElementType.taskControllerCapabilities.xmlTag, 'TCC');
    expect(Iso11783ElementType.taskData.xmlTag, 'ISO11783_TaskData');
    expect(Iso11783ElementType.time.xmlTag, 'TIM');
    expect(Iso11783ElementType.timeLog.xmlTag, 'TLG');
    expect(Iso11783ElementType.treatmentZone.xmlTag, 'TZN');
    expect(Iso11783ElementType.valuePresentation.xmlTag, 'VPN');
    expect(Iso11783ElementType.worker.xmlTag, 'WKR');
    expect(Iso11783ElementType.workerAllocation.xmlTag, 'WAN');
    expect(Iso11783ElementType.unknown.xmlTag, '');
  });
}
