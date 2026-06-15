@extends('layouts.admin.app')
@section('title', 'Dashboard')
@section('content')
    <div class="page-wrapper">
        <div class="content">
            <div class="page-header">
                <div class="page-title">
                    <h4>Admin Dashboard</h4>
                    <h6>Thống kê tổng quan hệ thống</h6>
                </div>
            </div>

            @if (isset($error))
                <div class="alert alert-danger">
                    <strong>Lỗi!</strong> Đã xảy ra lỗi khi tải dữ liệu dashboard. Vui lòng thông báo cho quản trị viên.
                    @if (config('app.debug'))
                        <p>{{ $error }}</p>
                    @endif
                </div>
            @else
        

                <!-- Thống kê tài khoản -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count">
                            <div class="dash-counts">
                                <h4>{{ $statistics['accounts']['total'] }}</h4>
                                <h5>Tài khoản game</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="user"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das1">
                            <div class="dash-counts">
                                <h4>{{ $statistics['accounts']['available'] }}</h4>
                                <h5>Chưa bán</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="shopping-cart"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das2">
                            <div class="dash-counts">
                                <h4>{{ $statistics['accounts']['sold'] }}</h4>
                                <h5>Đã bán</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="check-circle"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das3">
                            <div class="dash-counts">
                                <h4>{{ $statistics['users']['total'] }}</h4>
                                <h5>Người dùng</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="users"></i>
                            </div>
                        </div>
                    </div>
                </div>

               

                    <div class="col-lg-3 col-sm-6 col-12 d-flex">
                        <div class="dash-count das3">
                            <div class="dash-counts">
                                <h4>{{ $statistics['users']['new_today'] }}</h4>
                                <h5>Người dùng mới hôm nay</h5>
                            </div>
                            <div class="dash-imgs">
                                <i data-feather="user-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tổng hợp giao dịch -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6 col-12">
                        <div class="dash-widget">
                            <div class="dash-widgetimg">
                                <span><i class="fa fa-arrow-down text-success"></i></span>
                            </div>
                            <div class="dash-widgetcontent">
                                <h5><span class="counters">{{ number_format($transactionSummary['total_deposit']) }}</span>
                                    VNĐ</h5>
                                <h6>Tổng nạp tiền</h6>
                            </div>
                        </div>
                    </div>
        
                    <div class="col-lg-3 col-sm-6 col-12">
                        <div class="dash-widget dash2">
                            <div class="dash-widgetimg">
                                <span><i class="fa fa-shopping-cart text-info"></i></span>
                            </div>
                            <div class="dash-widgetcontent">
                                <h5><span
                                        class="counters">{{ number_format($transactionSummary['total_purchase']) }}</span>
                                    VNĐ</h5>
                                <h6>Tổng mua hàng</h6>
                            </div>
                        </div>
                    </div>


                 

                    <div class="col-lg-4 col-sm-12 col-12 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header pb-0 d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Thống kê người dùng</h5>
                            </div>
                            <div class="card-body">
                                <div class="stats-list">
                                    <div class="stats-info mb-3">
                                        <p>Admin <span
                                                class="badge rounded-pill bg-primary">{{ $statistics['users']['admin'] }}</span>
                                        </p>
                                        <div class="progress">
                                            <div class="progress-bar bg-primary" role="progressbar"
                                                style="width: {{ ($statistics['users']['admin'] / $statistics['users']['total']) * 100 }}%"
                                                aria-valuenow="{{ $statistics['users']['admin'] }}" aria-valuemin="0"
                                                aria-valuemax="{{ $statistics['users']['total'] }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="stats-info mb-3">
                                        <p>Khách hàng <span
                                                class="badge rounded-pill bg-success">{{ $statistics['users']['user'] }}</span>
                                        </p>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar"
                                                style="width: {{ ($statistics['users']['user'] / $statistics['users']['total']) * 100 }}%"
                                                aria-valuenow="{{ $statistics['users']['user'] }}" aria-valuemin="0"
                                                aria-valuemax="{{ $statistics['users']['total'] }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="stats-info mb-3">
                                        <p>Thống kê người dùng mới</p>
                                        <div class="row">
                                            <div class="col-4">
                                                <small>Hôm nay:</small> <span
                                                    class="badge bg-info">{{ $statistics['users']['new_today'] }}</span>
                                            </div>
                                            <div class="col-4">
                                                <small>Tuần này:</small> <span
                                                    class="badge bg-info">{{ $statistics['users']['new_this_week'] }}</span>
                                            </div>
                                            <div class="col-4">
                                                <small>Tháng này:</small> <span
                                                    class="badge bg-info">{{ $statistics['users']['new_this_month'] }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Giao dịch gần đây -->
                <div class="card mb-0">
                    <div class="card-header">
                        <h4 class="card-title">Lịch sử giao dịch gần đây</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive dataview">
                            <table class="table datatable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Người dùng</th>
                                        <th>Loại giao dịch</th>
                                        <th>Số tiền</th>
                                        <th>Số dư trước</th>
                                        <th>Số dư sau</th>
                                        <th>Mô tả</th>
                                        <th>Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($recentTransactions as $key => $transaction)
                                        <tr>
                                            <td>{{ $transaction->id }}</td>
                                            <td class="productimgname">
                                                <a
                                                    href="{{ route('admin.users.show', ['id' => $transaction->user->id]) }}">{{ $transaction->user->username ?? 'N/A' }}</a>
                                            </td>
                                            <td>
                                                @if ($transaction->type == 'deposit')
                                                    <span class="badge bg-success">Nạp tiền</span>
                                                @elseif($transaction->type == 'withdraw')
                                                    <span class="badge bg-danger">Rút tiền</span>
                                                @elseif($transaction->type == 'purchase')
                                                    <span class="badge bg-primary">Mua hàng</span>
                                                @elseif($transaction->type == 'refund')
                                                    <span class="badge bg-warning">Hoàn tiền</span>
                                                @else
                                                    <span class="badge bg-secondary">{{ $transaction->type }}</span>
                                                @endif
                                            </td>
                                            <td>{{ number_format($transaction->amount) }} VNĐ</td>
                                            <td>{{ number_format($transaction->balance_before) }} VNĐ</td>
                                            <td>{{ number_format($transaction->balance_after) }} VNĐ</td>
                                            <td>{{ $transaction->description ?? 'N/A' }}</td>
                                            <td>{{ $transaction->created_at->format('d/m/Y H:i') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Biểu đồ tổng quan & Dịch vụ cần xử lý-->
                <div class="row mt-4">
                    <div class="col-lg-7 col-sm-12 col-12 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header pb-0 d-flex justify-content-between align-items-center">
                                <h5 class="card-title mb-0">Thống kê nạp tiền & mua hàng (7 ngày gần đây)</h5>
                            </div>
                            <div class="card-body">
                                <div id="sales_charts"></div>
                                <div class="table-responsive mt-3">
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th>Ngày</th>
                                                @foreach ($last7Days as $day)
                                                    <th>{{ $day['date'] }}</th>
                                                @endforeach
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><strong>Nạp tiền</strong></td>
                                                @foreach ($last7Days as $day)
                                                    <td>{{ number_format($day['deposits']) }}</td>
                                                @endforeach
                                            </tr>
                                            <tr>
                                                <td><strong>Mua hàng</strong></td>
                                                @foreach ($last7Days as $day)
                                                    <td>{{ number_format($day['purchases']) }}</td>
                                                @endforeach
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
          
                </div>

                  
                </div>
            @endif
        </div>
    </div>
@endsection

@push('scripts')
    <!-- <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        $(document).ready(function() {
            var salesData = {!! json_encode($last7Days) !!};

            var categories = salesData.map(function(item) {
                return item.date;
            });

            var depositData = salesData.map(function(item) {
                return item.deposits;
            });

            var purchaseData = salesData.map(function(item) {
                return item.purchases;
            });

            var options = {
                series: [{
                    name: 'Nạp tiền',
                    data: depositData
                }, {
                    name: 'Mua hàng',
                    data: purchaseData
                }],
                chart: {
                    height: 300,
                    type: 'area',
                    toolbar: {
                        show: false
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'smooth'
                },
                xaxis: {
                    type: 'category',
                    categories: categories
                },
                tooltip: {
                    x: {
                        format: 'dd/MM'
                    },
                    y: {
                        formatter: function(val) {
                            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' VNĐ';
                        }
                    }
                },
                colors: ['#5757f7', '#28a745']
            };

            var chart = new ApexCharts(document.querySelector("#sales_charts"), options);
            chart.render();
        });
    </script> -->
@endpush
