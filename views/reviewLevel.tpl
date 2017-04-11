<table class="table table-bordered">
    <tbody><tr>
      <th>审核级别</th>
      <th>审批人</th>
      <th>审核状态</th>
      <th>操作人</th>
      <th>操作时间</th>
      <th>备注</th>
    </tr>
    <tr v-for="item in personList">
      <td>{[ item["Level"] ]}级审批</td>
      <td>{[ item["UserName"] ]}</td>
      <td><span class="badge {[ item['RenderSatus'] ]}">{[ item['StatusTitle'] ]}</span></td>
      <td>{[ item["UserName"] ]}</td>
      <td>{[ item["Updated"] ]}</td>
      <td>{[ item["Detail"] ]}</td>
    </tr>
</tbody></table>