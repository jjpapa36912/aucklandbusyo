// ATEndpoints.swift

import Foundation

// ⚠️ 필요시 base를 여러분 계정/문서에 맞게 조정하세요.
// 최근 문서 기준으로 GTFS v3 + GTFS-rt가 같은 base일 수 있습니다.
private let AT_BASE = "https://api.at.govt.nz/gtfs/v3"

// 실시간 차량 위치 (GTFS-realtime, Protobuf)
let AT_ENDPOINT_VEHICLE_POSITIONS = "\(AT_BASE)/vehiclepositions"

// 실시간 도착/운행정보 (GTFS-realtime Trip Updates, Protobuf)
let AT_ENDPOINT_TRIP_UPDATES = "\(AT_BASE)/tripupdates"

// 주변 정류장 검색(정적 GTFS REST) — 반경은 적당히 조정
func AT_ENDPOINT_STOPS_NEARBY(lat: Double, lon: Double, radiusMeters: Int = 600) -> String {
    // v3 문서에 따라 경위도 파라미터 키가 lat/lon, lat/lng, latitude/longitude 중 하나일 수 있습니다.
    // 기본값으로 lat/lon 사용. 404나 400 나오면 키 이름을 맞게 바꿔주세요.
    return "\(AT_BASE)/stops/geosearch?lat=\(lat)&lon=\(lon)&radius=\(radiusMeters)"
}
