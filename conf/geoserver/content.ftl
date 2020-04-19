<table class="featureInfo">
  <caption class="featureInfo">${type.name}</caption>
  <tr>
<#list type.attributes as attribute>
  <#if !attribute.isGeometry>
    <th>${attribute.name}</th>
  </#if>
</#list>
  </tr>

<#list features as feature>

  <#list feature.attributes as attribute>
    <#if !attribute.isGeometry>
      <td>${attribute.value}</td>
    </#if>
  </#list>
  </tr>
</#list>
</table>
<br/>