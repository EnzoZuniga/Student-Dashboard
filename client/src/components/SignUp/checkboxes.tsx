import React from "react";
import { Radio } from "antd";
import { useQuery } from "@apollo/react-hooks";
import { SKILLS, RATES } from "../../graphql/query";

export default function Checkboxes({
  handleCheckboxesChange,
  checkboxValue
}: any) {
  const { error, loading, data } = useQuery(SKILLS);
  const { error: rateError, loading: rateLoading, data: rateData } = useQuery(
    RATES
  );
  if (error || rateError) return <p>error</p>;
  if (loading || rateLoading) return <p>loading</p>;

  console.log(data);
  console.log(rateData);

  const dataRate = rateData.rates.map((r: any) => ({
    id: r.id,
    label: r.label,
    value: r.level
  }));

  return (
    <div>
      {data.skills.map((s: any) => (
        <div key={s.id}>
          <label style={{ display: "block" }}>{s.name}</label>
          <Radio.Group
            options={dataRate}
            onChange={handleCheckboxesChange}
            value={checkboxValue[s.id]}
            name={s.id}
          />
        </div>
      ))}
    </div>
  );
}
